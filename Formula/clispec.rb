class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.10/clispec-v0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "721642c243e4d681861e7ff2f8653edc8ebdc15e5a63094e0e0f33ae45f69ab6"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.10/clispec-v0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "c388d2c41f4b249ab342eb4c26410acd07f4ff706aac268154c956af47f6fa97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.10/clispec-v0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad967a87baf46fd4acd40acf5756c7aaa185f1a4008f7e89d04048243c097761"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.10/clispec-v0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3b4bc3f7fba9a20fdb3b1b074327bbbf19ca9892179d60f10d061c7e819700a"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
