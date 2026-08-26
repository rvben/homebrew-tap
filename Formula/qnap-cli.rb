class QnapCli < Formula
  desc "CLI for QNAP NAS management"
  homepage "https://github.com/rvben/qnap-cli"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.14/qnap-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "2dc98646281f1fa68519b1b6e6eccf6ddc7d0f50908479afce99dbe6f70c94e8"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.14/qnap-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "4520ee70028a53de629db3dddb5a688e75bbc4c84027f6ff7cc0939d36817759"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.14/qnap-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b23e4b183be918ab4f03a6d31e69094f1a56be743f1918b77ed9ec6bd4ce0408"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.14/qnap-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8bb3d6cd95f57f7c2f3086841c24ab8d51e60510532b1b79105f7f482603d73"
    end
  end

  def install
    bin.install "qnap"
  end

  test do
    system "#{bin}/qnap", "--version"
  end
end
