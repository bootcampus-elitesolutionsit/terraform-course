# Vpc
resource "aws_vpc" "main" {
  count = var.create_vpc ? 1 : 0

  cidr_block         = var.cidr_block
  enable_dns_support = var.enable_dns_support
  instance_tenancy   = var.instance_tenancy

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
    var.vpc_tags,
  )
}

# Subnet - Public
resource "aws_subnet" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  vpc_id                  = element(aws_vpc.main.*.id, count.index)
  cidr_block              = element(var.public_subnets, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone

  # tags = merge(
  #   {
  #     "Name" = format(
  #       "%s-${var.public_subnet_suffix}-%s",
  #       var.name,
  #     )
  #   },
  #   var.tags,
  #   var.public_subnet_tags,
  # )
}

# IGW
resource "aws_internet_gateway" "gw" {
  count  = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = element(aws_vpc.main.*.id, count.index)

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}

# Rtb
resource "aws_route_table" "public" {
  count  = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0
  vpc_id = element(aws_vpc.main.*.id, count.index)

  tags = merge(
    {
      "Name" = format("%s-${var.public_subnet_suffix}", var.name)
    },
    var.tags
  )
}

resource "aws_route" "public_internet_gateway" {
  count = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw[0].id

  timeouts {
    create = "5m"
  }
}

# Rtb assoc
resource "aws_route_table_association" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public[0].id
}
