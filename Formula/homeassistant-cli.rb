class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.1.14/homeassistant-cli-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "d77beacd96ee542f59c402abd2b9e0396894660fede99e424872c01af3497774"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.1.14/homeassistant-cli-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "fcba10fb0f0e93591afd86719609ca86d660b8b16bb7259cfb7c3936e069dc28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.1.14/homeassistant-cli-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c70cefa1fae793ab5c9f0c2ada6e9e52d6e7ca222d1f93835985b544896c171b"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.1.14/homeassistant-cli-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9effcdd928f7ecb1aa6df1bf61c9621b3c2cffd80410bfcceac448ebbe4bc18c"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end
