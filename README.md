# Taurus Labs Homebrew Tap

```sh
brew install --cask tauruslabsofficial-tech/tap/earshare
```

| Cask | Description |
|---|---|
| [`earshare`](Casks/earshare.rb) | [EarShare](https://github.com/tauruslabsofficial-tech/EarShare-releases): play your Mac's audio on several Bluetooth headphones at once. Free. |

EarShare is free but not yet notarized by Apple, so this cask clears the download quarantine flag after installing. Without that, macOS would block the first launch. EarShare keeps itself up to date (`auto_updates`); `brew upgrade --greedy` also works.

`togetheraudio` was renamed to `earshare`.
