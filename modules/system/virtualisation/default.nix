{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./podman.nix
    ./virt-manager.nix
  ];

}
