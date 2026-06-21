class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.3/clihatch-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "52449ef9255cd70c5b38dfeb111c92b4004c0d1baf4da866178acf180033c608"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.3/clihatch-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "a11c02f0f30c6294ff74bebc4d6b73b96bfa66580119def7f0f3967fa5f8217a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.3/clihatch-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3db467b93a7d6efeb162721c76137d5669f52d5ac77479dbcdbfe34c08833af8"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.3/clihatch-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69e0a145fcadfff0cc9b81d6e4660969049ac2a422507c10c5560d4f2cb2135d"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
