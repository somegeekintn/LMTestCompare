# LMTestCompare

> *"I asked some LLMs to write a unit converter. Here's what happened."*

This is a **low-effort, high-curiosity** experiment. I gave the same prompt to various LLMs and collected their attempts into a single SwiftUI app so I could compare them all in one place.

## What This Is

A SwiftUI app that lets you select from a list of LLM-generated "length converter" implementations and see how each one performs — both in terms of generation stats (token speed, memory usage, time) and actual runtime behavior.

Each model was given the same prompt:
> *"Write a complete SwiftUI ContentView.swift for a length unit converter. It should support kilometers, miles, meters, and feet. Use @State for input and unit selection. No external dependencies. Think this through very carefully."*

## What This Is Not

- A polished, production-ready unit converter
- A serious benchmark suite
- Something I spent a lot of time on

This is basically a digital museum of "look what these models came up with" — including the hilarious failures. Some models compiled and worked, some compiled but didn't function, and some just got stuck in infinite loops.

## Why This Exists

Curiosity. I wanted to see how different models handled the same task and whether bigger models actually produced better code.

This started as a text file of notes that kept growing as I tested more models. It got messy, so I turned it into this app — basically those notes in a more usable form. Now you can browse all the results in one place and actually try each model's output yourself.
