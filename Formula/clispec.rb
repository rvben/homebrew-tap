class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.3.0/clispec-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb20da77f5a6810e53a6c41fbb5e0ca29772dd8fc4bb23bb16a0519d94c394ff"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.3.0/clispec-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9497d6f3f0b9da674957b357f292ff0f960b986c30f42ef84da4a30c682a494e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.3.0/clispec-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d701555fb5b934417244e2de82d6e55bcb0a74f00ddeda41c17b7d3b9a9f93f"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.3.0/clispec-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0507415598c04a65dd6d8212d7774040e0f66dcd465589243b617351dc620d6b"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
