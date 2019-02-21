# Play

**Play allows you to define shell executions as configurations. You just provide the YAML file and the play script will execute it. It allows you to easily reuse snippets***

To use this utility simply run

```
docker run lakruzz/play
```

To learn more you can use switches `--man` or `--help`


# NAME
    PLAY - A declarative approach to executing - all kinds of stuff

# SYNOPSIS
      PLAY --part PART [--manuscript MANUSCRIPT] [--[no]verbose] [--dryrun]
      PLAY --help | --man

# OPTIONS
##  REQUIRED
      --part PART

      The part to play from the manuscript

##  OPTIONAL
      --manuscript MANUSCRIPT

      The manuscript that contains the different parts to play. This option
      overrides the default manuscript.

      --[no]verbose

      Prints the whole part from the manuscript before the play begins, and
      prints each shell commands before execution. The default is
      --[no]verbose, but can be set in the manuscript, or overruled using
      this option.

    --dryrun

      Implies "--verbose". Prints all the verbose information, but doesn't
      actually execute anything.

##  PROTIP
    Options can be applied with double or single dashes as you like, so both
    "--verbose" and "-verbose" are valid. You can even abbreveate the option
    name, it will remain valid as long as it's unique among all options.

    Example: since there are no other options except "--verbose" that begins
    with 'v' it means that even "-v" is valid.

# DESCRIPTION
    Copyright

    Lars Kruse, 2018, www.lakruzz.com <http://www.lakruzz.com>

    License

    GPL v3.0

    Repository

    github.com/lakruzz/perls <http://github.com/lakruzz/perls>

    Support and feeback

    Use the issues <http://github.com/lakruzz/perls/issues> in the repo.

