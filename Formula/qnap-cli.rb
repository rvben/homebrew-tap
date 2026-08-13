class QnapCli < Formula
  desc "CLI for QNAP NAS management"
  homepage "https://github.com/rvben/qnap-cli"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.13/qnap-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "b353279dc993917d63af64a32d3cd93d5264d1cb98d77b44ad08a300577cf3e0"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.13/qnap-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "817061e7dae17a378166e5cb40d5338124d5a671c3eb9eb5b0afbe73a5439a12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.13/qnap-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8db2f793d78986e1cb3e1d7108479ff42f27fe824d45a5e5e7ca173d6cac615"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.13/qnap-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "334e40e57b171a68189d130d9adf918f858920c32de22638f723e9b9dd5fe800"
    end
  end

  def install
    bin.install "qnap"
  end

  test do
    system "#{bin}/qnap", "--version"
  end
end
