class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.1/homeassistant-cli-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "fab0b9953ba3ef119e4e1e8754de5c4ad99bd438b54f43e0773c598382ec5124"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.1/homeassistant-cli-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "24cb0eb967a1101ecfec239ff9bdaccd89c03c4aba30a5a3e8555940faa66bca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.1/homeassistant-cli-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5fb4af92a7aa1968111c3c06944612e0007a59a468e4a83128ce43c03d57ca3"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.1/homeassistant-cli-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f50d89088381f3e2a2b18868e95372febc55b6d4ecec05bfe07ef2945dde3c1"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
