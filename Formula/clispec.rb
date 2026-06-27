class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.6/clispec-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "f787e501b3f7b79c54123291870da5c0cf14796a56db04615b5b96ecd6bf22ac"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.6/clispec-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "8d273b2264ae762d6e512441ab2827ce04f35eef88c2f61653fab63e666212a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.6/clispec-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2b85d3dc114702fdb46bf6fec5137c331ce0349182de93008a0e2912268e7f1"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.6/clispec-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c9edc3ea17caee891d71949a2f5ed39176c18463a3ed8c52c06c3f0a4c1db81"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
