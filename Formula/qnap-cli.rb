class QnapCli < Formula
  desc "CLI for QNAP NAS management"
  homepage "https://github.com/rvben/qnap-cli"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.15/qnap-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "7c2a22888a7d81050f5a096a9f2e09ddb31d4c03061b3b4182d858a69331a787"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.15/qnap-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "960fa57f69febb5af88876efe572d13da4769c65ec13c4df4ed4c9c63f2642b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.15/qnap-v0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "852c0fbe41f93e08372f926e3a7b2f4a90bd5e16465860d0d1a0c0ee37810be5"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.15/qnap-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "186503a4e7394a2ceb89111c6f53d3f4248436bbb705836e33a9af04c81e04d3"
    end
  end

  def install
    bin.install "qnap"
  end

  test do
    system "#{bin}/qnap", "--version"
  end
end
