// ViewModel/StoryViewModel.swift
import SwiftUI

class StoryViewModel: ObservableObject {
    // Published properties for the View to observe
    @Published private var currentIndex = 0
    @Published var isLastStory = false

    private let stories: [String] = [
        """
        Hello, friend! My name is Bubbly, and I live at the very bottom of a beautiful, shimmering river. It's a magical place filled with sparkling water, playful fish, and colorful plants. But lately... something very strange and very sad has been happening.
        """,
        """
        Every day, I see more and more **trash** floating down from above—empty bottles, cans, plastic bags, and even things I can't recognize! It's not just me who's worried. The fish are scared, the plants are wilting, and my best friend, Finn the Frog, told me his favorite lily pad is covered in yucky stuff.

        """,
        """
        "Where is all this trash coming from?" I wondered aloud one day. Could it be from the people who live near the river? Maybe from a faraway village? I don’t know. But one thing I do know is that it's making my beautiful river home sad and sick. My fishy friends are losing their homes, the turtles have nowhere safe to lay their eggs, and even the birds above the water are getting tangled in all this mess.

        """,
        """
        I can't let this happen to my river and my friends! I need to **find out where all this trash is coming from** and figure out how to stop it. But how? The river flows from somewhere far, far away... I’ll need to travel upstream, meet the people who live there, and figure out how we can work together to protect the river.

        """,
        """
        It’s going to be an adventure like no other! Will you come with me? Together, we can explore, discover new friends, and maybe, just maybe, save my river. Let’s get started—there’s no time to waste!ay their eggs, and even the birds above the water are getting tangled in all this mess.
        """,
        
    ]

    // Current story text
    var currentStoryText: String {
        stories[currentIndex]
    }

    // Go to the next story
    func goToNextStory() {
        if currentIndex < stories.count - 1 {
            currentIndex += 1
        }
        isLastStory = currentIndex == stories.count - 1
    }
}
