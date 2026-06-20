class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.2/homeassistant-cli-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "d1e005f6cc820b17c6287498b53979fb489dc43c7242eb36f0e2df8808c03952"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.2/homeassistant-cli-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "e3bce8363c73eea625e440318eb3b984b367981ca65df55eda026051db7f1280"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.2/homeassistant-cli-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81c09a5eeb81137d0f0c66713116264b1841353cd5a766c1695cc73ce059a266"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.2/homeassistant-cli-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96ee286552679bc24bbaa6b040fba163bbb1e1c6522fc2710799c90412fcc025"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
