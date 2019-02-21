# Play

**Play allows you to define shell executions as configurations. You just provide the YAML file and the play script will execute it. It allows you to easily reuse snippets***

To use this utility simply run

```
docker run lakruzz/play
```

To learn more you can use switches `--man` or `--help`


<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#SYNOPSIS">SYNOPSIS</a></li>
  <li><a href="#OPTIONS">OPTIONS</a>
    <ul>
      <li><a href="#REQUIRED">REQUIRED</a></li>
      <li><a href="#OPTIONAL">OPTIONAL</a></li>
      <li><a href="#PROTIP">PROTIP</a></li>
    </ul>
  </li>
  <li><a href="#DESCRIPTION">DESCRIPTION</a></li>
</ul>

<h1 id="NAME">NAME</h1>

<p>PLAY - A declarative approach to executing - all kinds of stuff</p>

<h1 id="SYNOPSIS">SYNOPSIS</h1>

<pre><code>  PLAY --part PART [--manuscript MANUSCRIPT] [--[no]verbose] [--dryrun]
  PLAY --help | --man</code></pre>

<h1 id="OPTIONS">OPTIONS</h1>

<h2 id="REQUIRED">REQUIRED</h2>

<pre><code>  --part PART</code></pre>

<ul>

<p>The part to play from the manuscript</p>

</ul>

<h2 id="OPTIONAL">OPTIONAL</h2>

<pre><code>  --manuscript MANUSCRIPT</code></pre>

<ul>

<p>The manuscript that contains the different parts to play. This option overrides the default manuscript.</p>

</ul>

<pre><code>  --[no]verbose</code></pre>

<ul>

<p>Prints the whole part from the manuscript before the play begins, and prints each shell commands before execution. The default is --[no]verbose, but can be set in the manuscript, or overruled using this option.</p>

</ul>

<p>--dryrun</p>

<ul>

<p>Implies <code>--verbose</code>. Prints all the verbose information, but doesn&#39;t actually execute anything.</p>

</ul>

<h2 id="PROTIP">PROTIP</h2>

<p>Options can be applied with double or single dashes as you like, so both <code>--verbose</code> and <code>-verbose</code> are valid. You can even abbreveate the option name, it will remain valid as long as it&#39;s unique among all options.</p>

<p><b>Example:</b> since there are no other options except <code>--verbose</code> that begins with &#39;v&#39; it means that even <code>-v</code> is valid.</p>

<h1 id="DESCRIPTION">DESCRIPTION</h1>

<p><b>Copyright</b></p>

<p>Lars Kruse, 2018, <a href="http://www.lakruzz.com">www.lakruzz.com</a></p>

<p><b>License</b></p>

<p>GPL v3.0</p>

<p><b>Repository</b></p>

<p><a href="http://github.com/lakruzz/perls">github.com/lakruzz/play</a></p>

<p><b>Support and feeback</b></p>

<p>Use the <a href="http://github.com/lakruzz/play/issues">issues</a> in the repo.</p>
