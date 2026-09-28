class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.34/confluence-cli-v0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "570573f62782ee6112831a42084258afc5b65da38d34ae1e0c609946e0ce16aa"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.34/confluence-cli-v0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "6febc95b11d0633fa557242f9b12fbbce3670738badeac7d993c124cdc77643e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.34/confluence-cli-v0.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43f17dd8cacff8157f191d13d1d7acc398ac273fae56e50e4f282892eff54fe0"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.34/confluence-cli-v0.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8bfd5c412e6f4bc24e725764b8c73e131b655bc9372a3809335042b9148a3d3"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
