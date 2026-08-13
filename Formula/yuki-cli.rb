class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.10/yuki-cli-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "f4907e604be9fa597ba33b155da817661e1c7f40bfe3da4fd5b487ea5c42b04e"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.10/yuki-cli-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "b328217923cd105ed329cd4f361fc313d5ec7b83eda10990edfbd3bb0757f069"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.10/yuki-cli-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "721912b0e95cb577864c55cc07085d380a165052c54f48ea502656ef12cc8e09"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.10/yuki-cli-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "728c6ac4b80cb14ed16895849f1111f4b0ccf55a1b0c70038c23559706fd86b7"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
