``` sh
wget https://github.com/godotengine/godot/releases/download/4.2.2-stable/Godot_v4.2.2-stable_export_templates.tpz
unzip Godot_v4.2.2-stable_export_templates.tpz
mkdir -p ~/.local/share/godot/export_templates
mv templates ~/.local/share/godot/export_templates/4.2.2.stable
mkdir export
godot4 --headless --export-release Web
npx local-web-server -d export --https --cors.embedder-policy "require-corp" --cors.opener-policy "same-origin"
```
