class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.4/unifi-cli-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "3e353778282b03a588564b9b1f3bf15b5088691d8ba7f9e54e3a4082f1ea8e2d"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.4/unifi-cli-v0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "c0d2c0caf455e963c2e2d0d68f2269a8a34e1b30c0b79ae8ebfb55568e7cd389"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.4/unifi-cli-v0.3.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be47f025f4c673e3bfec5dee7ab8bf86507b5f1178d3f7258568e979dd145281"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.4/unifi-cli-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fbcdf1ca9e103cc7eef19f625f39a80b8de39bd2c0ecd00ede83d581e2a9cdd"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
