//
//  Projects.swift
//  HU-Donations
//
//  Created by Cesa Salaam on 11/29/16.
//  Copyright © 2016 Cesa Salaam. All rights reserved.
//

import Foundation

//Creating dummy projects

var project = projectObject.init(image: "feat_howard05__01.jpg", description: "This Project serves to reconfigure the internet in the Computer Science Department. The internet is severely slow and is constantly going off-line. Please donate so this project can move forward. ", title: "Computer Science: Internet Repair", owner: "Comp Sci Department")
var project2 = projectObject.init(image: "newBuilding.jpg", description: "Howard University's Department of Computer Science is looking to develop a new building. This building would better facilitate the academic success of our students by providing the students with the latest and greatest technologies. Please donate to this project so that it may move forward! The students need a new building.", title: "Project: New Building", owner: "Comp Sci Department")
var project3 = projectObject.init(image: "womanStudent.jpg", description: "This Project serves to increase company presence on campus. We would like to begin developing new relationships with companies who are seeking to help develop the minds and talent of our Computer Science Student. Please donate so this project can move forward. ", title: "Company Presence", owner: "Comp Sci Department")
var project4 = projectObject.init(image: "feat_howard05__01.jpg", description: "This Project serves to increase GIR's on campus. By increase Google in Residence on campus, we will be able to further build a relationship with GOOGLE and develop the skills of our students by allowing them to be in contact with computer scientist who are active in the field. Please donate so this project can move forward.", title: "Computer Science", owner: "Dr. Burge")

var projectArray: [projectObject] = [project, project2, project3,project4]
