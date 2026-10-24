class OnenoteCli < Formula
  desc "Read and capture OneNote notes through a Windows desktop"
  homepage "https://github.com/rvben/onenote-cli"
  url "https://static.crates.io/crates/onenote-cli/onenote-cli-0.1.3.crate"
  version "0.1.3"
  sha256 "fa4029799d559fc9ae95fa14b7fff94abb06a617c1b9f5e3fd8002030d47e86b"
  license "MIT"

  depends_on "rust" => :build

  on_linux do
    depends_on "openssh"
  end

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "onenote"
  end

  def caveats
    <<~EOS
      OneNote access requires the Windows desktop application. On macOS and Linux,
      configure an SSH profile pointing to a Windows machine with OneNote.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onenote --version")
    assert_match "Usage:", shell_output("#{bin}/onenote --help")
  end
end
