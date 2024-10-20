# {
#   security = {
#     rtkit.enable = true;
#     pam.services = {
#       greetd = {
#         gnupg.enable = true;
#         enableGnomeKeyring = true;
#       };
#       login = {
#         enableGnomeKeyring = true;
#         gnupg = {
#           enable = true;
#           noAutostart = true;
#           storeOnly = true;
#         };
#       };
#     };
#     polkit.enable = true;
#   };
# }
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  #security.pam.services.swaylock = { };
}
