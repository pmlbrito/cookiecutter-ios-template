//
//  OnboardingSamplePageViewModel.swift
//  {{ cookiecutter.project_name | replace(' ', '') }}
//
//  Created by {{ cookiecutter.lead_dev }} on 3/29/17.
//  Copyright © 2017 {{ cookiecutter.company_name }}. All rights reserved.
//
import UIKit

struct OnboardingSamplePageViewModel {

    let header: String
    let body: String?
    let asset: UIImage?

}

struct OnboardingContent {

    static var pageViewModels: [OnboardingSamplePageViewModel] {
        let samplePage1 = OnboardingSamplePageViewModel(
            header: "{{ cookiecutter.project_name | replace(' ', '') }} welcome",
            body: "AK-47. The very best there is. When you absolutely, positively got to kill every motherf*cker in the room, accept no substitutes.",
            asset: #imageLiteral(resourceName: "ic_content_image")
        )
        let samplePage2 = OnboardingSamplePageViewModel(
            header: "Here we go",
            body: "Please! God dammit! I hate this hacker crap!",
            asset: #imageLiteral(resourceName: "ic_content_image")
        )
        let samplePage3 = OnboardingSamplePageViewModel(
            header: "Let's get started {{ cookiecutter.project_name | replace(' ', '') }}",
            body: "Yeah, Zeus! As in, father of Apollo? Mt. Olympus? Don’t f*ck with me, or I’ll shove a lightning bolt up your ass? Zeus! You got a problem with that?",
            asset: #imageLiteral(resourceName: "ic_content_image")
        )
        return [samplePage1, samplePage2, samplePage3]
    }
}
