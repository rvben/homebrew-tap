class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.1/clispec-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "435a1b4da860e715f930a0ba379d37da0841b52fdd11613257c1524d49532ea2"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.1/clispec-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "4b83ef0b260d7a55ad90dc6a888270d10d50d23375097580ee8f72d31e794f5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.1/clispec-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddde6e5c1e2b9a13a760e1b519d8949a72e2ad1c5ff07d57384b295e90aa7d14"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.1/clispec-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32a4e396e74f3923499efda7a03b3152f5409443ba822200b95c5c35be296bb9"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
