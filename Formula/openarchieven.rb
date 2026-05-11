class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.0/openarchieven-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1595fc223767ff9612615ff8a5b3bde49a9e7d25be20ef77914b1125ec995ca"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.0/openarchieven-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec2bd3809fd03e1e92a0d0afe62cfcecc000c166263bdec5d71c75c7212a0f65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.0/openarchieven-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5c11c112e50fe99f1aadcf28810f6a64e6909c3bd08a603986c1f3fa20aa6bc"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.0/openarchieven-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ceadfbd946c2e19ac01033fb84a731f0b588cf22f69259668bffc361682bcdb"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
