
variable "ssh-key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2j87btp1tymIYVt2wY3WPo5MLBH9iaNtkHcA6lokbhcLU/WxEJSxsTZvq8GvEkRRt1l0vRiMrWb8R5A/LLhyOZ/QSYpwACTECs6GtJ6xs+ZXt/z5k4EnSieNjyq1mGwW/TF7D9IkLokEoFuldUDUn1t+wOMECH1NuxjwpTrSNXHMs46+E2N9vjxGsyHoRDpCDnjH31Qpk7zJ0GBMS6qP1x85aOhlC6Xlkits8XmvWMxqpFLyFNvpIoGURbXf+XT90s2CFxUeXPqRFbD845UMwyKY1HB19xC+2hbo5JsVI1gsYBQ3a4Qg+9y7AU2mbvmGjjT+fNMItOJ1bdTScsveakbqA0YuZV3zvczmYusZY6yrhIPu3Sj2x896P8hiU6hnFQb7jG+VNszPTIZoTbZQ7SLULuTUHQYUMjSflXI6k9hLo/gVsviJbi/OT5Oc44i0VMW6FQ5vOV7qrxgRbpHe4dQSwXHauk0slSw6sRJN0QG9QutI9hbBYB0oGFkyqBec= Leonn@Nounous"
  description = "ssh key pair. log into the php server"

}

variable "ami" {
  type        = string
  default     = "ami-0dfcb1ef8550277af"
  description = "ami for php server"

}