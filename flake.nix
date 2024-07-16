{
  description = "Godot project flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      godotVersion = "4.2.2";
      pkgs = nixpkgs.legacyPackages.${system};

      godotTemplates = pkgs.fetchurl {
        url = "https://github.com/godotengine/godot/releases/download/${godotVersion}-stable/Godot_v${godotVersion}-stable_export_templates.tpz";
        sha256 = "sha256-HbmM6B83xhO5SJGlr6pnoHX9GkN0UbRwglGKwrGCtjE=";
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          godot_4
          nodejs_22
          unzip
        ];

        shellHook = ''
          TEMPLATES_DIR="$HOME/.local/share/godot/export_templates"
          if [ ! -d "$TEMPLATES_DIR" ]; then
            mkdir -p "$TEMPLATES_DIR"
            unzip -q "${godotTemplates}" -d "$TEMPLATES_DIR"
            mv "$TEMPLATES_DIR/templates" "$TEMPLATES_DIR/4.2.2.stable"
          fi

          mkdir -p export

          serve() {
            npx local-web-server -d export --https --cors.embedder-policy "require-corp" --cors.opener-policy "same-origin"
          }

          build() {
            godot4 --headless --export-release Web
          }
        '';
      };
    };
}
