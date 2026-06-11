class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.2/clispec-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "788b0c1b1cf72cefb371fb69707a10b20d7854f250b2ce2c56173174e65a57a6"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.2/clispec-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "75ba8f685996becf75fd68fc1c3309a97a32946eeb4e7b5447bc5641dccc2312"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.2/clispec-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27117dad5f009d833d52262ce724ddef05d5485d4a1808b95c04313f7240c55b"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.2/clispec-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5962a2e932bea4246dba98385da2741c1e1c4d61d5d43451068d30b7d2ef2c6"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
