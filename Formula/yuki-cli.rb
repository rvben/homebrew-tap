class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.8/yuki-cli-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "281bb57a79ac43f949a1f9621ae762144b9910731d106ac144d5b568c93eb291"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.8/yuki-cli-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "ab1da8de6d68ac5e90edb546e7b64da8991197713fe68f8f07a85777a1068e12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.8/yuki-cli-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c390260362e3b797de6e8df8bde3a7243705dc4e3fa61521a0dd32f8dfda295"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.8/yuki-cli-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe764f7d24f975a33710fa03e16da97d1570bb505c807fc8199b33c7dab11bd6"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
