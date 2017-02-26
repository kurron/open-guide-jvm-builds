/*
 * Copyright (c) 2017. Ronald D. Kurr kurr@jvmguy.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kurron.aws

import org.junit.experimental.categories.Category
import org.kurron.categories.UnitTest
import org.kurron.traits.GenerationAbility
import spock.lang.Specification

/**
 * An example unit-level test.
 **/
@Category( UnitTest )
class EchoUnitTest extends Specification implements GenerationAbility {

    def 'exercise happy path'() {
        expect: 'just to exercise Spock'
        true == true
    }
}
