class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.5/unifi-cli-v0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "75f58f5d15f2744a0c9a690018592cbca3ab1e7826e58fbd19d6b96cbda23bc9"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.5/unifi-cli-v0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "2870d35a4c03180a1ff9740b3f9266e16f677871f1d72dd2fd6f232a7fb78bd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.5/unifi-cli-v0.3.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b2f1a026841a670512f8c59dc3d96b67696eac60d4e0079db07c0b2716d64a3"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.5/unifi-cli-v0.3.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3d18b5417815c658d4dd48664f54866f9258c60fa2d45c1ad7b0458be4528f5"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
