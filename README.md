``` sh
godot4 --headless --export-release Web
npx local-web-server -d export --https --cors.embedder-policy "require-corp" --cors.opener-policy "same-origin"
```
