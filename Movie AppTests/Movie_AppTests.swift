//
//  Movie_AppTests.swift
//  Movie AppTests
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import XCTest
@testable import Movie_App

class Movie_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Test Request API
    func testGetPopularMovieList() throws {
        //given
        let requestMovie = APIGetMovieList(endpoint: "popular", page: 1)
        
        //when
        requestMovie.requestMovieList(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.totalResults, 10000)
            }
        })
    }
    
    func testGetUpcomingMovieList() throws {
        //given
        let requestMovie = APIGetMovieList(endpoint: "upcoming", page: 1)
        
        //when
        requestMovie.requestMovieList(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.totalResults, 442)
            }
        })
    }
    
    func testGetTopRatedMovieList() throws {
        //given
        let requestMovie = APIGetMovieList(endpoint: "top_rated", page: 1)
        
        //when
        requestMovie.requestMovieList(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.totalResults, 9228)
            }
        })
    }
    
    func testGetNowPlayingMovieList() throws {
        //given
        let requestMovie = APIGetMovieList(endpoint: "now_playing", page: 1)
        
        //when
        requestMovie.requestMovieList(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.totalResults, 1764)
            }
        })
    }
    
    func testGetMovieDetail() throws {
        //given
        let requestDetail = APIGetMovieDetail(id: 580489)

        //when
        requestDetail.requestMovieDetail(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.title, "Venom: Let There Be Carnage")
            }
        })
    }
    
    func testGetMovieReview() throws {
        //given
        let requestMovieReview = APIGetMovieReview(id: 580489, page: 1)
        
        //when
        requestMovieReview.requestMovieReview(completionHandler: { result in
            DispatchQueue.main.async {
                //then
                XCTAssertEqual(result.results[0].author, "garethmb")
            }
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
