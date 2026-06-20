class QnapCli < Formula
  desc "CLI for QNAP NAS management"
  homepage "https://github.com/rvben/qnap-cli"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.12/qnap-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "b7323080091658ca4ca7a00173f220ef239764a109cdc988dd1b8d3ce90ff678"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.12/qnap-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "08ea01dbc0a4a838500476ace963d3aad2d5c8e74de61b5b7a88ae72ed166d35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.12/qnap-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05ffd711b866752713ce0d7c5ba60f2b7e4b2aa97a03f23395a6758b4b50985d"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.12/qnap-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8eb273a112039acfabda5a395be82dfc742b5350c90529dfc710a2853a17f1ba"
    end
  end

  def install
    bin.install "qnap"
  end

  test do
    system "#{bin}/qnap", "--version"
  end
end
