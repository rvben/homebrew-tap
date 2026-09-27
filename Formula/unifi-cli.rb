class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.4/unifi-cli-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "daa743ccee63d1e1c74b1b6a6913160a6e57b581c152588e2d17d6933d6387c4"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.4/unifi-cli-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "12558f5a57aa9c309d9fd217c83cd2ab28b967293519b9bde2665b33dc8febb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.4/unifi-cli-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4237e16b8f2dd95716ebdcd5498578b276e7ac1e1d070d934e789a6c8b709ce8"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.4/unifi-cli-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44792d8b699b349af20bd498112e796dca2c6d09a178f510e8269f4cef6ca9b2"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
