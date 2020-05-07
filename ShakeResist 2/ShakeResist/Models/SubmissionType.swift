//
//  SubmissionType.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/6/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file is responsible to contain the different types of data that my app will eventually support including PDFs, URLs, and Strings
*/

import Foundation

enum SubmissionType {
    //This app won't support PDF at launch because that would require me to restructure the whole Data Structure of the app since PDFs can contain all types of content and I just want to start with a string for proof of concept
    case PDF, URL, String
}
