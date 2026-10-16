class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.3/cacheferret-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "79ce489429c545be237cbb38b8ab6d21c38362c881b528c1caff16534dd2e2f7"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.3/cacheferret-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "9f1b2363947f9e6ddccb2015c1df28be956178d36e77f05e4ef904aa1dd5c979"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.3/cacheferret-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f88107e018ace8ce70bff5ad311eba9e3544e33b4a8bf553782838b88206ce5"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.3/cacheferret-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "beed380893653cc1d6a318f21033caf9cc3880de252d7808333afcbfba6841a8"
    end
  end

  def install
    bin.install "cacheferret"
    bash_completion.install "completions/cacheferret.bash" => "cacheferret"
    zsh_completion.install "completions/_cacheferret"
    fish_completion.install "completions/cacheferret.fish"
  end

  test do
    assert_match "\"clispec\": \"0.3\"", shell_output("#{bin}/cacheferret schema")
  end
end
