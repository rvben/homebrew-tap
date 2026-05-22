class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.7/unifi-cli-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "3f6fa0723abe67a7678265162cd907833cd020476b13bd74672b48413cfb4c55"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.7/unifi-cli-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "2824b563d4d829efd2361685c8e4cd1f7b233aa9a6974925e01ee21bd59d80f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.7/unifi-cli-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad8dae6270b35df3dc751f824605a79c02d8f493c9d7f60f0d52a6fb79fea951"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.7/unifi-cli-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a94997058e6a229972ca6f8b935cd33ad34144440e65b6eb0d5ce5c3e63bed86"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
