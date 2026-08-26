class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.11/yuki-cli-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "f01328f01b3c4e5b89da681dc7880ae0621a746f47aceed95576bac162a647f5"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.11/yuki-cli-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "3662f058000110694c313108bd0fb790e6e82b5ed34a9766528850d5a499042f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.11/yuki-cli-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a567312c1035b99d0c82c86d42b89619e495759c294d8c07b9cf39c1439af1f"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.11/yuki-cli-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28878a74eb67a18367971055d3974862558d281e2aa45ca00111588d10195c50"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
