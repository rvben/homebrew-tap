class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.1/unifi-cli-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "2faca12b394312a30b7d708bcae5e8b3c0b3dad980b98841eb988ca7cd45fb99"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.1/unifi-cli-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "421587a66c0a35e2f320f2ca9d1dca26c76159824ad93cde6bd3145b8556dc3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.1/unifi-cli-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc1937d21c12a068d685e707a8722955c4f9699ebbc8749aa0539849db6b7624"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.1/unifi-cli-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff85e790cbb3e318c9a48d1c1fc714aed79264000d51ecc89eddd33683aebdbf"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
