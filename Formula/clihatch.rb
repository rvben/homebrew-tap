class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.1/clihatch-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "127bc8304b9b934809cc3f0d7e9a698a25a1488c5f374258ba5856d47938eb4c"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.1/clihatch-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "2cfbdff7edb6668851945ae5b29ea3e5090f13e9562a35be6731d9075c56eb52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.1/clihatch-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a57b1b94b8acd5a8f6b0524aff91e2969453eff2afe11439a9ca45312687b58"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.1/clihatch-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c903200bb2ba86e23ada5fdf407109a4260acf7e5dc61bec8f3febb4e849b17"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
