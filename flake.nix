{
  description = "A simple wrapper for agenix";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs: {
    nixosModules.default = {
      imports = [ ./module.nix ];
      config._module.args.inputs = inputs;
    };
    lib = import ./lib.nix { lib = inputs.nixpkgs.lib; };
  };
}
