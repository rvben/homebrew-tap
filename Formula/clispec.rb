class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "04f269e3a81b77577b7b80fa78d5531ff90888810a3657ccc3618b51efe716a3"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "2faa84e0f64b83f322a5aea6a7e1bd8d08a08b351a4ccd439e65e6e950de17fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0f9e3b61bf4cd6ac45dbba93ef422e29b8c8bf7abf6cbd6b66e9dd1a280f5a5"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.1.5/clispec-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a54d4a6937437b920d6872a0af25b940a74d824509c1759ad7859bc7e5bb8650"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
