class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.0/clispec-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "b13add2ee93263916918a5749aebf9fd964f66b19b6c6f343159e67f95a6d3b2"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.0/clispec-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "349e14ab0b020491a4f0e25b84915796a8fead5d5f58a51e901d75eeb907173d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.0/clispec-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d0d2b082e17370946bbbeee733d5d2fac71d5571c4bb056723144937c8ea45d"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.0/clispec-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1be5ea41bd9394264c49695366745759358e6f91dcfb5cba135a6e0b650291ff"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
