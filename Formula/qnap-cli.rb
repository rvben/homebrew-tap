class QnapCli < Formula
  desc "CLI for QNAP NAS management"
  homepage "https://github.com/rvben/qnap-cli"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.11/qnap-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "d353b3623631c2383cd3794050968fb5a775bd449045710dbc96dd229b06959d"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.11/qnap-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "4e515b48d304bec9c4f4759bb24f1d5a1ae77ae58bf48b03529766ff63f08341"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.11/qnap-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca3b69b5a7ce6f5de2821d307a0128ac53084437098455533ab16dbe515cb759"
    else
      url "https://github.com/rvben/qnap-cli/releases/download/v0.1.11/qnap-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "990e6591c58ad41f805e4eb7e7152c032d4d846b7af1ce4685509a760cf36316"
    end
  end

  def install
    bin.install "qnap"
  end

  test do
    system "#{bin}/qnap", "--version"
  end
end
