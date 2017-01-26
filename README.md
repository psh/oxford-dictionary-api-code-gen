An incredibly powerful feature of Swagger documentation is the ability to generate not just human readable live docs - https://developer.oxforddictionaries.com/documentation - but also all the code needed to talk to an API.

Note: You will need at least Java 7 to run through this exercise.

# 1. Download the Swagger code generation tool

At the time of writing this, swagger-codegen is at version 2.2.1 and can be obtained from http://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.1/swagger-codegen-cli-2.2.1.jar

# 2. Create a working directory

Create a working directory and copy the swagger-codegen-cli-2.2.1.jar into it.  I am lazy, so I also renamed it to "swagger-codegen.jar" to save typing.

#3. Check everything is ready to go

Check out the help built into Swagger codegen by typing

```
java -jar swagger-codegen.jar help
```

You should see a helpful message telling you about the options you have available.  If you need a deeper-dive into Swagger codegen documentation, take a look at http://swagger.io/swagger-codegen/

# 4. Create an "output" directory

Swagger needs somewhere to place the generated client code and things just get messy if you generate 150 source files into the current directory!  

# 5. Create a configuration file

For this example, I will generate a Java client to talk to the Oxford Dictionary API.  The tool supports dozens of other languages and frameworks - take a look at the list by running

```
java -jar swagger-codegen.jar langs
```

The fictional project I am creating uses Retrofit v2 and RxJava, so my configuration file ("config.json") for Swagger will look like this:

```json
{
  "sourceFolder": "src",
  "modelPackage": "com.gatebuzz.oxford.model",
  "apiPackage": "com.gatebuzz.oxford.api",
  "library": "retrofit2",
  "useRxJava": true
}
```

# 6. Run Swagger Codegen

I need to tell Swagger to
* Generate a Java client
* Configure itself from "config.json"
* Read the Oxford Dictionary API docs
* Write to the "output" directory I created

The command line is a little long, but looks like this (note: line continuation "\" characters have been inserted to aid clarity.)

```
java -jar swagger-codegen.jar generate \
   --lang java \
   -c config.json \
   -o output \
   -i https://developer.oxforddictionaries.com/swagger/spec/public_doc_guest.json
```

The tool is quite chatty as its reading files and creating code.  When its finished you will have a working project in the "output" directory!
