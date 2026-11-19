class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.39/confluence-cli-v0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "a87dbd564ece550e71104d36902d597374501a26f0003378d299eabef6ed49e2"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.39/confluence-cli-v0.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "160000b9b335fa2a152b8861100f6a816bda780ac0601cd8500cc96ea728e2d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.39/confluence-cli-v0.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a8997152ecefa79447d3184ef51856d21e755fa57d47859201083c0f64ee895"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.39/confluence-cli-v0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8eec7b70bb15e8b6ff5873552e796b4a51a2c138fadd73a4412bf0abeae24154"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
