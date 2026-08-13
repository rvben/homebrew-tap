class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.6/clihatch-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "7f505046c1d91dbf756c3940782910f218ddc9e067d2aae763394d968d912848"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.6/clihatch-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "a4d2dc404f1431b914400583f1d4da89c100dc8fac11bf6680c6832edf65e68c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.6/clihatch-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45102264eabfdc4056c308e5ce96bd99aebe7ce6c3fbb0552919465acc03b4db"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.6/clihatch-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4272910b2acfda93016cf797f09f676241440cdcc06da9bf948568f069ce4a31"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
