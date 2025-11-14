
{ lib, config, pkgs, ... }:

{

  options = {
  };


  config = {


    # Julia
    programs.nix-ld.enable = true;
    programs.bash.shellAliases.install-julia = "sudo curl -fsSL https://install.julialang.org | sh";
    
    environment.systemPackages = with pkgs; [

      # python
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.numpy
        python-pkgs.matplotlib
      ]))

      # julia
      (import ./run-julia.nix { inherit pkgs; })

  ];



  
};


}
