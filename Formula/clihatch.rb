class Clihatch < Formula
  desc "Scaffold a clispec-compliant, agent-facing Rust CLI in seconds"
  homepage "https://github.com/rvben/clihatch"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.2/clihatch-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "9609fba55dd3545de48a5aff489dc0e2746ce2aace29366b9886749dcb28a2ad"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.2/clihatch-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "57758db69cff90f2151fd79581a900f9b170d957152eda2c85c55ddf50fb7826"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clihatch/releases/download/v0.1.2/clihatch-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29dbf2f021502c062a87ddc88bd30fd3afc3bbb8b23239b7c1ad843c610d089b"
    else
      url "https://github.com/rvben/clihatch/releases/download/v0.1.2/clihatch-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfb2458fd06c6dec3a1bd011794e3ada7a8e98413a8f0197467e4bc03cc709c4"
    end
  end

  def install
    bin.install "clihatch"
  end

  test do
    system "#{bin}/clihatch", "--version"
  end
end
