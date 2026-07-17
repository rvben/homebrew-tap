class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.4/openarchieven-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "badb97b2b6e788ad601afaa6d77efa92c259c883b3454be553127cf557a830dd"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.4/openarchieven-0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "b4d7aad697f6862dbf65dc51b7f7c20cf62ab404806e2ce4aa330a80d25a5474"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.4/openarchieven-0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9651b89f506375f358f7bff82d0028ff7288cc95c71f8be29b2cce4d4c896d8c"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.4/openarchieven-0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc8eb27dedd5d49790fd5f99fa18842d6e98b7a6af6ec49743a0838335b29157"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end
