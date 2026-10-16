class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.4/cacheferret-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "32d27a0ce0273c7abe16eff4038a8f49e14cfcecc2b854b95f27524a81990c40"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.4/cacheferret-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "a8b0e9a72a87efe505d51c645ab8f14094decabefbf30dce417c17c731996c51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.4/cacheferret-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c8dd2c168ea7b3eaa6cc639d61ed206bd8454bc02a3cd94424adba2524f9baa"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.4/cacheferret-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7c2c95a14be2be3839cbc721f6f48530f138e07afb19cdd54b382edc6433cc0"
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
