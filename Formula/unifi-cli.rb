class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.3/unifi-cli-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "43a6ca87c764cdb5250eac18e468b81913323a95734ca89f5027a56ba5a5362c"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.3/unifi-cli-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "a7c53835a570d55718d27f724c7edf184f29f7a6dc76108fede8ada958e19042"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.3/unifi-cli-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa74b1eb856fc768f77b3cadbb9006f4a30e2701b151c391abedd35080c94ed1"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.3/unifi-cli-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc26f912db234d5dc6dffc35912f201795a40eb8d11322a007adb01b2dcc158b"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
