class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.6/unifi-cli-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "1bb2fb146d4ed80aa874f21e2a512679465b683518791fda8c3fe2d2651963b5"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.6/unifi-cli-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "d50e46bf84b49d8de92a0dbb2fc6cbddb677f31a5c2ade4cc8c53bb1650a6db1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.6/unifi-cli-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d86f64d14761ad6dfcf96ef26091e8adeaa678816d48bed2bdeee78faea0b22"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.1.6/unifi-cli-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eeea197d00a0b2d1fbb772053dcfe39da4f2510411069623227a736f72839d7"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
